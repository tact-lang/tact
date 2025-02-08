export interface Signature {
    name: string;
    signature: string;
}

/**
 * Computes the Jaro similarity between two strings.
 */
function jaro(s1: string, s2: string): number {
    if (s1 === s2) return 1;
    const len1 = s1.length,
        len2 = s2.length;
    if (len1 === 0 || len2 === 0) return 0;
    const matchDistance = Math.floor(Math.max(len1, len2) / 2) - 1;
    const s1Matches = new Array<boolean>(len1).fill(false);
    const s2Matches = new Array<boolean>(len2).fill(false);
    let matches = 0,
        transpositions = 0;

    for (let i = 0; i < len1; i++) {
        const start = Math.max(0, i - matchDistance);
        const end = Math.min(i + matchDistance + 1, len2);
        for (let j = start; j < end; j++) {
            if (s2Matches[j]) continue;
            if (s1[i] !== s2[j]) continue;
            s1Matches[i] = true;
            s2Matches[j] = true;
            matches++;
            break;
        }
    }

    if (matches === 0) return 0;

    let k = 0;
    for (let i = 0; i < len1; i++) {
        if (!s1Matches[i]) continue;
        while (!s2Matches[k]) k++;
        if (s1[i] !== s2[k]) transpositions++;
        k++;
    }
    transpositions /= 2;

    return (
        (matches / len1 +
            matches / len2 +
            (matches - transpositions) / matches) /
        3
    );
}

/**
 * Computes the Jaro-Winkler similarity between two strings.
 */
function jaroWinkler(s1: string, s2: string): number {
    const jaroSim = jaro(s1, s2);
    let prefix = 0;
    const maxPrefix = 4;
    for (let i = 0; i < Math.min(maxPrefix, s1.length, s2.length); i++) {
        if (s1[i] === s2[i]) prefix++;
        else break;
    }
    const scalingFactor = 0.1;
    return jaroSim + prefix * scalingFactor * (1 - jaroSim);
}

/**
 * Splits an identifier into lower-cased tokens using camelCase, underscores, spaces, or digits as separators.
 */
function splitIdentifier(identifier: string): string[] {
    return identifier
        .split(/(?=[A-Z])|[_\s\d]/)
        .map((s) => s.toLowerCase())
        .filter((s) => s.length > 0);
}

/**
 * Normalizes a string for similarity comparison.
 * Lowercases and removes underscores and spaces.
 */
function normalize(str: string): string {
    return str.toLowerCase().replace(/[_\s]/g, "");
}

/**
 * Computes a composite similarity score between the unknown query and a candidate.
 *
 * Uses:
 *  - Base similarity: Jaro-Winkler similarity on normalized strings.
 *  - A token bonus: adds bonus for each token match; if at least 2 distinct tokens match, add an extra bonus.
 *  - A containment bonus: if one normalized string contains the other.
 *  - An exact match bonus: if the normalized forms are exactly equal.
 *  - A mild length penalty.
 */
function computeCompositeScore(
    unknown: string,
    candidate: string,
): {
    score: number;
    tokensMatched: number;
    normQuery: string;
    normCandidate: string;
    contains: boolean;
} {
    const normQuery = normalize(unknown);
    const normCandidate = normalize(candidate);

    // Base similarity from Jaro-Winkler.
    const baseSimilarity = jaroWinkler(normQuery, normCandidate); // between 0 and 1

    // Exact match bonus.
    const exactBonus = normQuery === normCandidate ? 0.3 : 0;

    // Containment bonus.
    const contains =
        normCandidate.includes(normQuery) || normQuery.includes(normCandidate);
    const containmentBonus = contains ? 0.2 : 0;

    // Token bonus.
    const tokensQuery = new Set(splitIdentifier(unknown));
    const tokensCandidate = new Set(splitIdentifier(candidate));
    let tokenBonus = 0;
    let tokensMatched = 0;
    tokensQuery.forEach((tq) => {
        tokensCandidate.forEach((tc) => {
            if (tq === tc) {
                tokenBonus += 0.2;
                tokensMatched++;
            } else if (tq.startsWith(tc) || tc.startsWith(tq)) {
                tokenBonus += 0.1;
                tokensMatched++;
            }
        });
    });
    // Extra bonus if at least 2 distinct tokens match.
    if (tokensMatched >= 2) {
        tokenBonus += 0.2;
    }

    // Length penalty: subtract 0.01 per extra character in candidate.
    const lengthPenalty = Math.max(0, candidate.length - unknown.length) * 0.01;

    const score =
        baseSimilarity +
        exactBonus +
        containmentBonus +
        tokenBonus -
        lengthPenalty;

    return { score, tokensMatched, normQuery, normCandidate, contains };
}

/**
 * Suggests signatures similar to the unknown name.
 *
 * - Returns [] if the unknown query is empty.
 * - Computes a composite score for each candidate.
 * - Discards candidates with a score below MIN_SCORE.
 * - If any candidate's normalized name exactly equals the normalized query, returns only those.
 * - If the best candidate's score is below an absolute threshold (ABS_MIN_SCORE), returns [].
 * - Additionally, if the normalized query is at least 3 characters long, restrict to candidates whose normalized form starts with the first 3 letters of the normalized query (if any do).
 * - Finally, returns only candidates whose score is within TOLERANCE of the best score.
 * - Limits the final returned list to at most 3 suggestions.
 */
export function suggestSignatures(
    unknown: string,
    signatures: Signature[],
): Signature[] {
    if (unknown.trim() === "") return [];

    const ABS_MIN_SCORE = 0.7;
    const MIN_SCORE = 0.5;
    const TOLERANCE = 0.05;

    // Score candidates.
    const scoredCandidates = signatures.map((f) => {
        const { score, normQuery, normCandidate, contains } =
            computeCompositeScore(unknown, f.name);
        return { ...f, score, normQuery, normCandidate, contains };
    });

    // Filter by minimum score.
    let candidates = scoredCandidates.filter((c) => c.score >= MIN_SCORE);

    // If any candidate's normalized name exactly equals the query, keep only those.
    const exactMatches = candidates.filter(
        (c) => c.normCandidate === c.normQuery,
    );
    if (exactMatches.length > 0) {
        candidates = exactMatches;
    }

    if (candidates.length === 0) return [];

    // If the best candidate is below the absolute threshold, return [].
    const bestScore = Math.max(...candidates.map((c) => c.score));
    if (bestScore < ABS_MIN_SCORE) return [];

    // Additional prefix filtering: if the normalized query is at least 3 characters,
    // restrict to candidates whose normalized form starts with the first 3 characters of the query,
    // if any such candidates exist.
    const prefix = candidates[0]!.normQuery.slice(0, 3);
    const candidatesByPrefix = candidates.filter((c) =>
        c.normCandidate.startsWith(prefix),
    );
    if (candidatesByPrefix.length > 0) {
        candidates = candidatesByPrefix;
    }

    // Return candidates within TOLERANCE of the best score, then limit the list to at most 3 suggestions.
    const bestCandidates = candidates
        .filter((c) => c.score >= bestScore - TOLERANCE)
        .sort((a, b) => b.score - a.score || a.name.localeCompare(b.name))
        .map(
            ({
                score: _score,
                normQuery: _normQuery,
                normCandidate: _normCandidate,
                contains: _contains,
                ...rest
            }) => rest,
        )
        .slice(0, 4);

    return bestCandidates;
}
