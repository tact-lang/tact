struct S { optInt: Int?; }
struct T { nested: S; val: Bool; }

contract NestedOptStorage {
    data: T;

    init() {
        self.data = T {
            nested: S { optInt: null },
            val: true,
        };
    }
}