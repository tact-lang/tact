struct L5 { value: Int }

struct L4 { l5: L5 }

struct L3 { l4: L4 }

struct L2 { l3: L3 }

struct L1 { l2: L2 }

contract TestDeepNested {
    receive() {
        let instance = L1{ l2: L2{ l3: L3{ l4: L4{ l5: L5{ value: 99 } } } } };
        dump(instance.l2.l3.l4.l5.value);
    }
}
