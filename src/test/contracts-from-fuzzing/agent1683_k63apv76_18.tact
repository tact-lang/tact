struct SDeepOpt {
    x: Int?;
}

struct WDeepOpt {
    inner: SDeepOpt?;
}

contract TestContract {
    val: WDeepOpt = WDeepOpt{ inner: null };
}