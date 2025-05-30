// Large struct nested within optional
struct Large {
    a: Int; b: Int; c: Int; d: Int;
    e: Bool; f: Bool; g: Bool;
    h: String; i: String;
    j: Address; k: Slice; l: Cell;
}

struct OuterOpt {
    big: Large?;
    flag: Bool;
}

contract LargeOptional {
    payload: OuterOpt;
    init() {
        self.payload = OuterOpt{
            big: null,
            flag: true,
        };
    }
}