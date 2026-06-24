contract TestUnderscoreFallback {
    x: Int = 0;
    
    receive(_: Slice) {
        self.x = 555;
    }
}
