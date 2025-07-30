struct A { a: Int; }
struct B { b: Int; }
struct C { c: Int; }
struct D { d: Int; }
struct E { e: Int; }

struct Tuple {
    a: A;
    b: B;
    c: C;
    d: D;
    e: E;
}

struct NestedTuple {
    t1: Tuple;
    t2: Tuple;
    t3: Tuple;
}

contract BigTuple {
    nested: NestedTuple;

    init() {
        self.nested = NestedTuple{
            t1: Tuple{
                a: A{a:1}, b: B{b:2}, c: C{c:3}, d: D{d:4}, e: E{e:5}
            },
            t2: Tuple{
                a: A{a:6}, b: B{b:7}, c: C{c:8}, d: D{d:9}, e: E{e:10}
            },
            t3: Tuple{
                a: A{a:11}, b: B{b:12}, c: C{c:13}, d: D{d:14}, e: E{e:15}
            }
        };
    }
    receive() {}
}