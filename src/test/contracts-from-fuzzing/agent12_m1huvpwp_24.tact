struct Payload {
    header: Int;
    data: Slice as remaining;
}

contract TestContract {
    p: Payload;

    init() {
        self.p = Payload{
            header: 123,
            data: slice("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw=")
        };
    }
}