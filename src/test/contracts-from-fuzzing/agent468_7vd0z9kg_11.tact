// Contract with constant, persistent complex struct, and optional
struct Blob {
    a: Int;
    b: Bool;
    s: String?;
}

contract ComboFields {
    const MAGIC: Int = 42;
    blob: Blob;
    optStr: String?;

    init() {
        self.blob = Blob{ a:7, b:true, s:null };
        self.optStr = null;
    }
}