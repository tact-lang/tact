struct OptInner { a: Int; b: Bool }
struct OuterOpt { nestedOpt: OptInner?; flag: Bool }

contract OptionalNested {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{ nestedOpt: null, flag: false };
    }
}