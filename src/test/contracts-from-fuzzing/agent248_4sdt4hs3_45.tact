struct SameName {
    myval: Int;
}
contract TestContract {
    myval: Int;
    val: SameName;
    init() {
        self.myval = 123;
        self.val = SameName{ myval:42 };
    }
}