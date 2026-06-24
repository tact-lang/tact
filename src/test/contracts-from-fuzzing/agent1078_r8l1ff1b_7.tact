struct SubNested { info: String; count: Int; }
struct NestedOpt { data: SubNested?; flag: Bool; }

contract OptionalNested {
    state: NestedOpt;

    init() {
        self.state = NestedOpt{ data: null, flag: false };
    }
}