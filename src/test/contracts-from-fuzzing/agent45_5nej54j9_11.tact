struct A { v: Int; }

struct B { a: A?; }

struct C { b: B?; }

struct D { c: C?; }

struct E { d: D?; }

contract TestContract {
    receive() {
        let e = E{ d: D{ c: C{ b: B{ a: A{ v: 777 } } } } };
        if (e.d != null) {
            let d_val: D = e.d!!;
            if (d_val.c != null) {
                let c_val: C = d_val.c!!;
                if (c_val.b != null) {
                    let b_val: B = c_val.b!!;
                    if (b_val.a != null) {
                        let a_val: A = b_val.a!!;
                        a_val.v;
                    } else {
                        0;
                    }
                } else {
                    0;
                }
            } else {
                0;
            }
        } else {
            0;
        }
    }
}
