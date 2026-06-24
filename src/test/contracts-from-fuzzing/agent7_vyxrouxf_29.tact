contract TestCellNoPad {
    // Testing cell() with a base64 string missing the expected padding. 
    // The expected behavior is to reject the input as invalid base64 encoding.
    stored: Cell = cell("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw");

    receive() {}
}
