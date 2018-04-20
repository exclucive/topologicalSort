//: Playground - noun: a place where people can play

import UIKit

class Vertex<T: Hashable>: Hashable {
    let value: T
    var neighbors:[Edge<T>] = []
    
    init(value: T) {
        self.value = value
    }

    var hashValue: Int {
        return value.hashValue
    }
    
    static public func ==(lhs: Vertex<T>, rhs: Vertex<T>) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}

class Edge<T: Hashable> {
    let destination: Vertex<T>
    let weight: Double
    
    init(destination: Vertex<T>, weight: Double = 0) {
        self.destination = destination
        self.weight = weight
    }
}

class Graph<T: Hashable> {
    typealias Node = Vertex<T>
    typealias Connection = Edge<T>

    var nodes: [T:Node] = [:]
    var directed = false
    
    init(directed: Bool) {
        self.directed = directed
    }

    //
    public func addNode(value: T) -> Node {
        guard let existingNode = nodes[value] else {
            let newNode = Node(value: value)
            nodes[value] = newNode
            
            return newNode
        }
        
        return existingNode
    }
    
    public func addEdge(from: Node, to: Node) {
        var edge = Connection(destination: to)
        from.neighbors.append(edge)
        
        if directed == false {
            var edge = Connection(destination: from)
            to.neighbors.append(edge)
        }
    }

    public func topologicalSort(node: Node) {
        
    }
}

let graph = Graph<String>(directed: true)
let _1 = graph.addNode(value: "1")
let _2 = graph.addNode(value: "2")
let _3 = graph.addNode(value: "3")
let _4 = graph.addNode(value: "4")

graph.addEdge(from: _1, to: _4)
graph.addEdge(from: _4, to: _2)
graph.addEdge(from: _4, to: _3)
graph.addEdge(from: _3, to: _2)





