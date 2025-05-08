struct Inner {
    v: Int;
}

struct NestedArray {
    a: Inner;
    b: Inner;
    c: Inner;
    d: Inner;
    e: Inner;
    f: Inner;
    g: Inner;
    h: Inner;
    i: Inner;
    j: Inner;
}

contract ManyNestedSameType {
    data: NestedArray;
    init() {
        self.data = NestedArray{
            a: Inner{v:1}, b:Inner{v:2}, c:Inner{v:3}, d:Inner{v:4}, e:Inner{v:5},
            f:Inner{v:6}, g:Inner{v:7}, h:Inner{v:8}, i:Inner{v:9}, j:Inner{v:10}
        };
    }
}