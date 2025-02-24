# Unhandled Exception in Asynchronous Dart Network Request

This repository demonstrates a common error in asynchronous Dart code, specifically how to properly handle exceptions that may occur during network requests.

The `bug.dart` file contains code that fetches data from an API but lacks robust error handling.  The `bugSolution.dart` file provides an improved version with better error handling.

**Problem:** The original code only prints the error to the console, which is insufficient for production applications.  A more robust approach would involve more informative logging, re-throwing the exception to allow upper-level handlers to deal with it, or returning a specific error state.

**Solution:** The improved code includes more detailed error handling using try-catch blocks, enabling specific actions based on error types and providing more context for debugging.