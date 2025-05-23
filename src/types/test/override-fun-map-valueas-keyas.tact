primitive Int;
trait BaseTrait {}
trait T {
    abstract get fun basic(): map<Int as uint8, Int as uint8>;

    abstract get fun pure(): map<Int, Int>;

    abstract get fun int257(): map<Int, Int>;

    abstract get fun coins(): map<Int, Int as coins>;
}

contract C with T {
    override get fun basic(): map<Int as uint8, Int as uint8> {
        return emptyMap();
    }

    override get fun pure(): map<Int, Int> {
        return emptyMap();
    }

    override get fun int257(): map<Int as int257, Int as int257> {
        return emptyMap();
    }

    override get fun coins(): map<Int, Int as varuint16> {
        return emptyMap();
    }
}
