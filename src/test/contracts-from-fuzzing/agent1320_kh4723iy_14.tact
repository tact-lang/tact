struct Inner {
    foo: Int? = null;
}

struct Middle {
    inner: Inner? = null;
}

contract MultiLevelOptional {
    m: Middle? = null;
}