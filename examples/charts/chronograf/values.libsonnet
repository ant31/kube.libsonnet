{
  image: {
    repository: "quay.io/influxdb/chronograf",
    tag: "latest",
    pullPolicy: "Always",
  },

  ## Specify a service type
  ## NodePort is default
  ## ref: http://kubernetes.io/docs/user-guide/services/
  service: {
    type: "ClusterIP",
  },

  ## Persist data to a persitent volume
  persistence: {
    enabled: true,
    ## If defined, volume.beta.kubernetes.io/storage-class: <storageClass>
    ## Default: volume.alpha.kubernetes.io/storage-class: default
    ##
    # storageClass:
    accessMode: "ReadWriteOnce",
    size: "8Gi",
  },

  ## Configure resource requests and limits
  ## ref: http://kubernetes.io/docs/user-guide/compute-resources/
  ##
  resources: {
    requests: {
      memory: "256Mi",
      cpu: "0.1",
    },
    limits: {
      memory: "2Gi",
      cpu: "2",
    },
  },

  ## Configure the ingress object to hook into existing infastructure
  ## ref : http://kubernetes.io/docs/user-guide/ingress/
  ##
  ingress: {
    enabled: false,
    tls: false,
    hostname: "chronograf.foobar.com",
    annotations: {
      "kubernetes.io/ingress.class": "nginx",
    },
  }
}
