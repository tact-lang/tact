struct NestedLarge {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
}

struct OuterLarge {
    s1: NestedLarge;
    s2: NestedLarge;
    s3: NestedLarge;
}

contract TestContract {
    val: OuterLarge;

    init() {
        self.val = OuterLarge{
            s1: NestedLarge{ a:1, b:2, c:3, d:4, e:5 },
            s2: NestedLarge{ a:6, b:7, c:8, d:9, e:10 },
            s3: NestedLarge{ a:11, b:12, c:13, d:14, e:15 }
        };
    }
}