contract InitSlice {
    s: Slice;

    init() {
        self.s = cell("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw=").asSlice();
    }
}