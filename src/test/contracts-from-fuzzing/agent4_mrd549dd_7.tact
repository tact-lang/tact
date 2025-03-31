/* Snippet G: AnnotatedValid - Valid usage of 'as' annotation with value within range */

struct AnnotatedValid {
    num: Int as uint8;
}

fun main() {
    let a = AnnotatedValid{ num: 42 };
}
