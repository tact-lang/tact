struct WithRemaining {
    s: String;
    rest: Slice as remaining;
}

contract RemainingStructTest {
    data: WithRemaining;

    init() {
        self.data = WithRemaining{
            s: "abc",
            rest: slice("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw=")
        };
    }
}
