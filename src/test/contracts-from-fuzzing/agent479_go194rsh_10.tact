struct BigStruct {
    a: Int; b: Bool; c: Address; d: String;
    e: Int; f: Bool; g: Address; h: String;
    i: Int; j: Bool; k: Address; l: String;
    m: Int; n: Bool; o: Address; p: String;
    q: Int; r: Bool; s: Address; t: String;
}

contract BigStructStorage {
    data: BigStruct;

    init() {
        self.data = BigStruct{
            a:1, b:true, c:myAddress(), d:"a",
            e:2, f:false, g:myAddress(), h:"b",
            i:3, j:true, k:myAddress(), l:"c",
            m:4, n:false, o:myAddress(), p:"d",
            q:5, r:true, s:myAddress(), t:"e",
        };
    }
}