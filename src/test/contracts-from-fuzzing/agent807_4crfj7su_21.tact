// contract: one param tuple that contains two big nested struct params
struct Blob {
    foo: Int;
    bar: String?;
    flag: Bool;
    optFlag: Bool?;
}

struct OuterBlob {
    left: Blob;
    right: Blob?;
}

contract TupleBigParams(
    fooParam: OuterBlob,
    barParam: OuterBlob?,
) {
    receive() {}
}