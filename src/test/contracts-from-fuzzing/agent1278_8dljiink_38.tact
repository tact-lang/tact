message(404) Blob {
    size: Int;
    tail: Cell as remaining;
}

contract TestContract(
    blobData: Blob,
) {}