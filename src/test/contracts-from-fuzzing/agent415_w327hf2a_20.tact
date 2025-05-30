struct Inner { data: Int?; }

contract NestedOpt {
    field: Inner?;

    init() {
        self.field = null;
    }
}