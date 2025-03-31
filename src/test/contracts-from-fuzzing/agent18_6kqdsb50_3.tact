contract RecursiveSelf {
    init() {
        let s = initOf RecursiveSelf();
    }
}
