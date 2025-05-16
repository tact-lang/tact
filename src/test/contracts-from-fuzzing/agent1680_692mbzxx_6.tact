struct WideTest {
    a: Int = 1;
    b: Bool = true;
    c: String = "x";
    d: String = "";
    e: Address?;
    f: Int?;
    g: Bool = false;
    h: String = "y";
    i: Int = 42;
    j: Bool = false;
    k: String = "z";
}

contract TestWideStorage {
    data: WideTest = WideTest{
        a:1, b:true, c:"A", d:"", g:true, h:"B", i:7, j:true, k:"C"
    };
    receive() {}
}