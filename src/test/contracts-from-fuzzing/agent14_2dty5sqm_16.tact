contract TestMapGetterModification {
    m: map<Int, Int> = emptyMap();

    init() {
         self.m.set(1, 100);
    }

    // This getter temporarily modifies m, but such modifications should not persist after the TVM run
    get fun modifyGetter(): Int {
         // Modify the state variable inside getter
         self.m.set(1, 200);
         // Return value after modification within the same TVM run
         return self.m.get(1)!!;
    }

    // This getter reads m without modification
    get fun readGetter(): Int {
         return self.m.get(1)!!;
    }
}
