struct Node1 {
    val: Int?;
    next: Node2?;
}

struct Node2 {
    val: Int?;
    next: Node3?;
}

struct Node3 {
    val: Int?;
}

contract NullableLinkedList(
    head: Node1?,
    size: Int,
) {}
