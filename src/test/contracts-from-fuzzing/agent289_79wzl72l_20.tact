struct DeeplyNested10{
    f: Int;
}

struct Nested9{ inner: DeeplyNested10; }
struct Nested8{ inner: Nested9; }
struct Nested7{ inner: Nested8; }
struct Nested6{ inner: Nested7; }
struct Nested5{ inner: Nested6; }
struct Nested4{ inner: Nested5; }
struct Nested3{ inner: Nested4; }
struct Nested2{ inner: Nested3; }
struct Nested1{ inner: Nested2; }

contract TenLevelsDeep {
    data: Nested1;

    init() {
        self.data = Nested1{ inner: Nested2{ inner: Nested3{ inner: Nested4{ inner: Nested5{ inner: Nested6{ inner: Nested7{ inner: Nested8{ inner: Nested9{ inner: DeeplyNested10{ f: 123 } } } } } } } } } };
    }
}