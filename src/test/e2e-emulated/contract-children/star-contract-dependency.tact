contract Parent {
    parentMark: Int = 2;
    receive() {}
    get fun getChild0():StateInit {
        return initOf Child0();
    }
    get fun getChild1():StateInit {
        return initOf Child1();
    }
    get fun getChild2():StateInit {
        return initOf Child2();
    }
    get fun getChild3():StateInit {
        return initOf Child3();
    }
    get fun getChild4():StateInit {
        return initOf Child4();
    }
    get fun getChild5():StateInit {
        return initOf Child5();
    }
    get fun getChild6():StateInit {
        return initOf Child6();
    }
    get fun getChild7():StateInit {
        return initOf Child7();
    }
    get fun getChild8():StateInit {
        return initOf Child8();
    }
    get fun getChild9():StateInit {
        return initOf Child9();
    }
}

contract Child0 {
    childNum: Int as uint32 = 0;
    receive() {}
}
contract Child1 {
    childNum: Int as uint32 = 0;
    receive() {}
}
contract Child2 {
    childNum: Int as uint32 = 0;
    receive() {}
}
contract Child3 {
    childNum: Int as uint32 = 0;
    receive() {}
}
contract Child4 {
    childNum: Int as uint32 = 0;
    receive() {}
}
contract Child5 {
    childNum: Int as uint32 = 0;
    receive() {}
    get fun getParent(): StateInit {
        return initOf Parent();
    }
}
contract Child6 {
    childNum: Int as uint32 = 0;
    receive() {}
}
contract Child7 {
    childNum: Int as uint32 = 0;
    receive() {}
}
contract Child8 {
    childNum: Int as uint32 = 0;
    receive() {}
}
contract Child9 {
    childNum: Int as uint32 = 0;
    receive() {}
}

