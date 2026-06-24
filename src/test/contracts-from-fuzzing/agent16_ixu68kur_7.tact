struct WithOptional {
    req: Int;
    opt: Int = 100;
}

fun testOptionalField(w: WithOptional): Int {
    return w.req + w.opt;
}

contract TestOptionalField {
    receive() {
         let w: WithOptional = WithOptional{ req: 10 };
         testOptionalField(w);
    }
}
