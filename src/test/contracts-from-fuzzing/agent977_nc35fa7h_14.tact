// contract param variant of nested struct
struct St {
    m: Int;
    n: String;
}

contract ParNested(
    inner: St,
    count: Int
) {
}