primitive Int;
trait BaseTrait { }

message SetIntMap4 {
    key: Int;
    value: SomeStruct?;
}

struct SomeStruct { value: Int }
