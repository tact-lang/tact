struct NestedRemaining {
    prefix: Int;
    payload: Slice as remaining;
}

struct Outer {
    inner: NestedRemaining;
    suffix: Bool;
}

contract InvalidRemainingInNestedStruct {
    data: Outer;

    init() {
        self.data = Outer{
            inner: NestedRemaining{
                prefix: 1,
                payload: slice("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw=")
            },
            suffix: true,
        };
    }
}
