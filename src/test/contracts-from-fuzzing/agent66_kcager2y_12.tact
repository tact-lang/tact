struct Inner1 { a: Int = 1; }
struct Inner2 { b: Int = 2; }
struct NestedBoth {
    s1: Inner1;
    s2: Inner2;
}

contract MultiNested {
 data: NestedBoth = NestedBoth{ s1: Inner1{}, s2: Inner2{} };
}