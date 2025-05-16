struct Inner1 { n: Int; }
struct Inner2 { flag: Bool; nested: Inner1; }

contract NestedStructOptional {
    storage: Inner2?;

    init() {
        self.storage = null;
    }
}
