struct X1 { a: Int }
struct X2 { b: Bool }

contract StructAsOptional {
    field: X1?;
    flag: Bool;

    init() {
        self.field = null;
        self.flag = true;
    }
}