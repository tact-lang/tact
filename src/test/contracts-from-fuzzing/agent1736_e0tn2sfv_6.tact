struct OptionalNested {
    n: Int?;
    s: String;
}

struct WrapOpt {
    item: OptionalNested?; 
    label: String;
}

contract NestedOptWrap {
    dat: WrapOpt;
    init() {
        self.dat = WrapOpt{
            item: null,
            label: "optionalwrap"
        };
    }
}