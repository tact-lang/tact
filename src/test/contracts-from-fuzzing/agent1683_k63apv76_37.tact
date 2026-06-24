struct RecursiveWrap1 {
    next: RecursiveWrap2;
}

struct RecursiveWrap2 {
    next: RecursiveWrap3;
}

struct RecursiveWrap3 {
    val: Int;
}

contract TestContract {
    top: RecursiveWrap1 = RecursiveWrap1{ next: RecursiveWrap2{ next: RecursiveWrap3{ val: 1 } } };
}