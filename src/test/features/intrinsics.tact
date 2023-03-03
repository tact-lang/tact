contract IntrinsicsTester {

    a: Int = ton("10.1234");
    b: String = "Hello world";
    c: Address = address("EQCD39VS5jcptHL8vMjEXrzGaRcCVYto7HUn4bpAOg8xqB2N");
    d: Cell = cell("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw=");
    e: Int = pow(2, 9);
    
    init() {

    }

    receive("Deploy") {

    }

    get fun getTons(): Int {
        return ton("10.1234");
    }

    get fun getTons2(): Int {
        return self.a;
    }

    get fun getString(): String {
        return "Hello world";
    }

    get fun getString2(): String {
        return self.b;
    }

    get fun getAddress(): Address {
        return address("EQCD39VS5jcptHL8vMjEXrzGaRcCVYto7HUn4bpAOg8xqB2N");
    }

    get fun getAddress2(): Address {
        return self.c;
    }

    get fun getCell(): Cell {
        return cell("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw=");
    }

    get fun getCell2(): Cell {
        return self.d;
    }

    get fun getPow(): Int {
        return pow(2, 9);
    }

    get fun getPow2(): Int {
        return self.e;
    }
}