struct RemainingTest {
    prefix: Int as uint16;
    suffix: Slice as remaining;
}

contract TestContract {
    data: RemainingTest;

    init() {
        self.data = RemainingTest{
            prefix: 42,
            suffix: slice("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw=")
        };
    }
}
