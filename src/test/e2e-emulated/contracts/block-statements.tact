import "@stdlib/deploy";

fun computeWithSubsequentBlocks(): Int {
    let b: Int = 100;
    {
        let a: Int = 456;
        b += a;
    }
    {
        let a: Int = 752;
        b += a;
    }
    return b;
}

fun computeWithNestedBlocks(): Int {
    let x1: Int = 42;
    {
        let x: Int = 42;
        {
            x1 += x;
        }
    }
    return x1;
}

const SubsequentConstant: Int = computeWithSubsequentBlocks();
const NestedConstant: Int = computeWithNestedBlocks();

contract Test with Deployable {
    receive("test") {}

    get fun A(): Int {
        let x1: Int = 42;
        {
            let x: Int = 42;
            {
                x1 += x;
            }
        }
        return x1;
    }

    get fun B(): Int {
        let b: Int = 100;
        {
            let a: Int = 456;
            b += a;
        }
        {
            let a: Int = 752;
            b += a;
        }
        return b;
    }

    get fun C(): Int {
        let b: Int = 100;
        {
            let a: Int = 456;
            b += a;
        }
        {
            let a: Slice = beginCell().storeBool(true).asSlice();
            b += a.bits();
        }
        return b;
    }

    get fun D(): Int {
        return SubsequentConstant;
    }

    get fun E(): Int {
        return NestedConstant;
    }
}
