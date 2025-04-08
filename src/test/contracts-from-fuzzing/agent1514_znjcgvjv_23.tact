struct S1 { a: Int }
struct S2 { b: Int }
struct S3 { c: Int }

contract MultipleStructFields {
    sx: S1;
    sy: S2;
    sz: S3;

    init() {
        self.sx = S1{ a:1 };
        self.sy = S2{ b:2 };
        self.sz = S3{ c:3 };
    }
}