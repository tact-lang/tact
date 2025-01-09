contract IntrinsicsTester {

    a: Int = ton("10.1234");
    b: String = "Hello world";
    c: Address = address("EQCD39VS5jcptHL8vMjEXrzGaRcCVYto7HUn4bpAOg8xqB2N");
    d: Cell = cell("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw=");
    e: Int = pow(2, 9);
    f: Int = sha256("hello world");
    g: Slice = slice("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw=");
    h: Slice = rawSlice("abcdef");
    i: Int = ascii("hello world");
    j: Int = crc32("transfer(slice, int)");
    k: Int = crc32("");
    l: Int = ascii("⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡");
    m: Slice = rawSlice("");
    n: Slice = rawSlice("4a_");
    o: Slice = rawSlice("0_");
    p: Slice = rawSlice("1_");
    q: Slice = rawSlice("_");
    r: Slice = rawSlice("7");
    s: Slice = rawSlice("abcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcf_");
    t: Slice = rawSlice("8a_");
    u: Slice = rawSlice("8a0_");
    w: Slice = rawSlice("8_");
    v: Slice = rawSlice("00_");

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

    get fun getComment(): Cell {
        return "Hello world".asComment();
    }

    get fun getHash(): Int {
        return sha256("hello world");
    }

    get fun getHash2(): Int {
        return self.f;
    }

    get fun getHash3(src: Slice): Int {
        return sha256(src);
    }

    get fun getHash4(src: String): Int {
        return sha256(src);
    }

    get fun getHashLongComptime(): Int {
        return sha256("------------------------------------------------------------------------------------------------------------------------------129");
    }

    get fun getHashLongRuntime(src: String): Int {
        return sha256(src);
    }

    receive("emit_1") {
        emit("Hello world".asComment());
    }

    get fun getSlice(): Slice {
        return slice("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw=");
    }

    get fun getSlice2(): Slice {
        return self.g;
    }

    get fun getRawSlice(): Slice {
        return rawSlice("abcdef");
    }

    get fun getRawSlice2(): Slice {
        return self.h;
    }

    get fun getRawSlice3(): Slice {
        return rawSlice("");
    }

    get fun getRawSlice4(): Slice {
        return self.m;
    }

    get fun getAscii(): Int {
        return ascii("hello world");
    }

    get fun getAscii2(): Int {
        return self.i;
    }

    get fun getAscii3(): Int {
        return ascii("⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡");
    }

    get fun getAscii4(): Int {
        return self.l;
    }

    get fun getCrc32(): Int {
        return crc32("transfer(slice, int)");
    }

    get fun getCrc32_2(): Int {
        return self.j;
    }

    get fun getCrc32_3(): Int {
        return self.k;
    }

    get fun getCrc32_4(): Int {
        return crc32("");
    }

    get fun getRawSlice5(): Slice {
        return rawSlice("4a_");
    }

    get fun getRawSlice6(): Slice {
        return self.n;
    }

    get fun getRawSlice7(): Slice {
        return rawSlice("0_");
    }

    get fun getRawSlice8(): Slice {
        return self.o;
    }

    get fun getRawSlice9(): Slice {
        return rawSlice("1_");
    }

    get fun getRawSlice10(): Slice {
        return self.p;
    }

    get fun getRawSlice11(): Slice {
        return rawSlice("_");
    }

    get fun getRawSlice12(): Slice {
        return self.q;
    }

    get fun getRawSlice13(): Slice {
        return rawSlice("7");
    }

    get fun getRawSlice14(): Slice {
        return self.r;
    }

    get fun getRawSlice15(): Slice {
        return rawSlice("abcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcf_");
    }

    get fun getRawSlice16(): Slice {
        return self.s;
    }

    get fun getRawSlice17(): Slice {
        return rawSlice("8a_");
    }

    get fun getRawSlice18(): Slice {
        return self.t;
    }

    get fun getRawSlice19(): Slice {
        return rawSlice("8a0_");
    }

    get fun getRawSlice20(): Slice {
        return self.u;
    }

    get fun getRawSlice21(): Slice {
        return rawSlice("8_");
    }

    get fun getRawSlice22(): Slice {
        return self.w;
    }

    get fun getRawSlice23(): Slice {
        return rawSlice("00_");
    }

    get fun getRawSlice24(): Slice {
        return self.v;
    }
}
