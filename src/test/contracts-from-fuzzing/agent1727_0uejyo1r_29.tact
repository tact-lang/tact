struct Reverso {
    last: Int;
    mid: Bool;
    first: String;
}

contract ReverseFields {
    d: Reverso;

    init() {
        self.d = Reverso{
            last: 11,
            mid: true,
            first: "start"
        };
    }
}
