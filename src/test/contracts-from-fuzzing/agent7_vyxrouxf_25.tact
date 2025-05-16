contract TestCellValid {
    // Testing cell() with a known valid base64-encoded BoC from the documentation
    stored: Cell = cell("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw=");

    receive() {}
}
