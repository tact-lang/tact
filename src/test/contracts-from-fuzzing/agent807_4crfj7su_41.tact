// nested optional record inside optional record, initialized default
struct In {
    opt: Int? = null;
}

struct Out {
    inner: In? = null;
}

contract DeepDefOpt {
    state: Out? = null;
}