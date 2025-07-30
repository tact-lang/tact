contract OptionalNested (
    inner: Inner?    
) {}

struct Inner {
    val: Int;
    flag: Bool;
    text: String;
}