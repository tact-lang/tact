struct A { v: Int; }

contract TenStructs {
    a1: A; a2: A; a3: A; a4: A; a5: A; a6: A; a7: A; a8: A; a9: A; a10: A;

    init() {
        self.a1=A{v:1}; self.a2=A{v:2}; self.a3=A{v:3}; self.a4=A{v:4}; self.a5=A{v:5};
        self.a6=A{v:6}; self.a7=A{v:7}; self.a8=A{v:8}; self.a9=A{v:9}; self.a10=A{v:10};
    }
}
