export type CompareResult = {
    pass: boolean;
    posMessage: () => string;
    negMessage: () => string;
};
