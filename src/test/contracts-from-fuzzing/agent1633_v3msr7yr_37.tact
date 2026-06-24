struct WrapOne {
    val: Int;
}
struct WrapTwo {
    inner: WrapOne;
}
struct WrapThree {
    inner: WrapTwo;
}
struct WrapFour {
    inner: WrapThree;
}
struct WrapFive {
    inner: WrapFour;
}

contract FiveDeepWrap {
    wrapper: WrapFive;

    init() {
        self.wrapper = WrapFive{
            inner: WrapFour{
                inner: WrapThree{
                    inner: WrapTwo{
                        inner: WrapOne{
                            val: 101
                        }
                    }
                }
            }
        };
    }
}