// optional nested optional int with serialization; nested optional is known unsupported for *types*, but inside struct opt field?

struct Inner { optInt: Int? as uint8; }

struct Outer { inner: Inner?; }

contract OptionalInOptionalSerialization {
    data: Outer;

    init() {
        self.data = Outer{inner:null};
    }
}