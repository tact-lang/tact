struct BigStruct {
    F1: Int;
    F2: Int;
    F3: Int;
    F4: Int;
    F5: Int;
    F6: Int;
    F7: Int;
    F8: Int;
    F9: Int;
    F10: Int;
    F11: Int;
    F12: Int;
    F13: Int;
    F14: Int;
    F15: Int;
    F16: Int;
    F17: Int;
    F18: Int;
    F19: Int;
    F20: Int;
    F21: Int;
    F22: Int;
    F23: Int;
    F24: Int;
    F25: Int
}

contract TestContract {
    receive(msg: Slice) {
        let instance: BigStruct = BigStruct {
            F1: 1,
            F2: 1,
            F3: 1,
            F4: 1,
            F5: 1,
            F6: 1,
            F7: 1,
            F8: 1,
            F9: 1,
            F10: 1,
            F11: 1,
            F12: 1,
            F13: 1,
            F14: 1,
            F15: 1,
            F16: 1,
            F17: 1,
            F18: 1,
            F19: 1,
            F20: 1,
            F21: 1,
            F22: 1,
            F23: 1,
            F24: 1,
            F25: 1
        };
        dump(instance.F1 + instance.F25);
    }
}
