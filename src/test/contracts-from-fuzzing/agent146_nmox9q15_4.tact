struct OneFieldWrapper {
    inner: InnerData;
}

struct InnerData {
    val: Int;
}

contract TestContract {
    wrapper: OneFieldWrapper = OneFieldWrapper{
        inner: InnerData{ val: 5 }
    };

    receive(){}
}