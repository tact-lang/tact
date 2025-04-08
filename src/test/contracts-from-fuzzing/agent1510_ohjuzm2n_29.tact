contract TestContract {
    const h: Int = crc32("hello world");
    dummy: Int = 0;

    init() {
        self.dummy = self.h;
    }

    receive() {
        let _ = self.dummy + self.h;
    }
}