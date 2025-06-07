// deeply nested optional booleans and strings
struct X1 { val: Bool?; }
struct X2 { val: X1?; }
struct X3 { val: X2?; }

contract OptDeep {
    data: X3;

    init() {
        self.data = X3{ val: null };
    }
}