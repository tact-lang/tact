struct DeepGroups {
    a: Int;
    b: Int;
    inner: Inner;
}

struct Inner {
    c: Int;
    d: Int;
    deeper: Deeper;
}

struct Deeper {
    e: Int;
    f: Int;
}

contract DeepGroupsTest {
    val: DeepGroups;

    init() {
        self.val = DeepGroups{
            a:1,
            b:2,
            inner: Inner{
                c:3,d:4,
                deeper: Deeper{e:5,f:6}
            }
        };
    }
}